# Copyright (c) 2020, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

from cumulusci.core.tasks import BaseTask

class TitleLogger(BaseTask):
    def log_title(self, title,):
        if title:
            self.logger.info("")
            self.logger.info(title)
            self.logger.info("─" * len(title))

class TableLogger(TitleLogger):

    def get_padded_log_columns(self, column_max_lengths, column_range, row,):
        log_row = []
        for index in column_range:
            column = row[index] if index < len(row) else ""
            log_row.append("{}{}".format(
                column,
                " " * (column_max_lengths[index] - len(column))
            ))
        return log_row

    def get_log_column_separators(
        self,
        columnBorders=True,
        padColumns=True,
    ):
        column_separators = {
            "value": "{}",
            "padsp": " " if padColumns else "",
            "pad─": "─" if padColumns else "",
            "┌": "┌" if columnBorders else "─",
            "┐": "┐" if columnBorders else "─",
            "└": "└" if columnBorders else "─",
            "┘": "┘" if columnBorders else "─",
            "├": "├",
            "┼": "┼",
            "┤": "┤",
            "┬": "┬",
            "┴": "┴",
            "│": "│",
        }

        if not columnBorders:
            column_separators.update({
                "├": "",
                "┼": "",
                "┤": "",
                "┬": "",
                "┴": "",
                "│": "",
            })

        return column_separators

    def get__table_Borders(
        self,
        column_max_lengths,
        columnBorders=True,
        padColumns=True,
    ):
        table_borders = {}
        table_borders["borders"] = []

        column_separators = self.get_log_column_separators(columnBorders, padColumns)

        for i in range(0, len(column_max_lengths) + 1):
            columns = []
            for index, length in enumerate(column_max_lengths):
                columns.append((" " if index < i else "─") * length)

            if i == 0:
                border_format = "".join([
                    "{├}{pad─}{value}{pad─}".format(**column_separators),
                    ("{┼}{pad─}{value}{pad─}" * (len(column_max_lengths) - 1)).format(**column_separators),
                    "{┤}".format(**column_separators),
                ])

                table_borders["header_border"] = "".join([
                    "{├}{pad─}{value}{pad─}".format(**column_separators),
                    ("{┼}{pad─}{value}{pad─}" * (len(column_max_lengths) - 1)).format(**column_separators),
                    "{┤}".format(**column_separators),
                ]).format(*columns)

                if columnBorders:
                    table_borders["header"] = "".join([
                        "{┌}{pad─}{value}{pad─}".format(**column_separators),
                        ("{┬}{pad─}{value}{pad─}" * (len(column_max_lengths) - 1)).format(**column_separators),
                        "{┐}".format(**column_separators),
                    ]).format(*columns)

                    table_borders["footer"] = "".join([
                        "{└}{pad─}{value}{pad─}".format(**column_separators),
                        ("{┴}{pad─}{value}{pad─}" * (len(column_max_lengths) - 1)).format(**column_separators),
                        "{┘}".format(**column_separators),
                    ]).format(*columns)
                else:
                    table_borders["header"] = table_borders["header_border"]
                    table_borders["footer"] = table_borders["header_border"]

            elif i < len(column_max_lengths):
                border_format = "".join([
                    ("{│}{padsp}{value}{padsp}" * i).format(**column_separators),
                    "{├}{pad─}{value}{pad─}".format(**column_separators),
                    ("{┼}{pad─}{value}{pad─}" * (len(column_max_lengths) - 1 - i)).format(**column_separators),
                    "{┤}".format(**column_separators),
                ])
            else:
                border_format = "".join([
                    ("{│}{padsp}{value}{padsp}" * len(column_max_lengths)).format(**column_separators),
                    "{│}".format(**column_separators)
                ])
                table_borders["row_format"] = border_format

            table_borders["borders"].append(border_format.format(*columns))

        return table_borders

    def format_log_rows(self, raw_rows):
        formatted_rows = {}
        formatted_rows["rows"] = []
        column_max_lengths = []
        formatted_rows["column_max_lengths"] = column_max_lengths

        if raw_rows:
            for raw_row in raw_rows:
                row = []
                formatted_rows["rows"].append(row)
                for index, raw_column in enumerate(raw_row):
                    column = str(raw_column) if raw_column else ""
                    row.append(column)
                    if index < len(column_max_lengths):
                        column_max_lengths[index] = max(column_max_lengths[index], len(column))
                    else:
                        column_max_lengths.append(len(column))
        return formatted_rows

    def log_table(
        self,
        raw_rows,
        groupByBlankColumns=False,
        rowBorders=True,
        columnBorders=True,
        padColumns=True,
        addHeaderBorder=True,
    ):
        formatted_rows = self.format_log_rows(raw_rows)
        rows = formatted_rows.get("rows")
        column_max_lengths = formatted_rows.get("column_max_lengths")
        
        if column_max_lengths:
            column_range = range(0, len(column_max_lengths))

            table_borders = self.get__table_Borders(
                column_max_lengths,
                columnBorders,
                padColumns, 
            )

            self.logger.info(table_borders.get("header"))

            #last_group_index = -1
            for index, row in enumerate(rows):
                # log border
                if addHeaderBorder and index == 1:
                    self.logger.info(table_borders.get("header_border"))
                elif rowBorders and 0 < index:
                    border_index = 0
                    if groupByBlankColumns:
                        border_index = len(column_max_lengths) 
                        for i in column_range:
                            if row[i]:
                                border_index = i
                                break
                    self.logger.info(table_borders.get("borders")[border_index])
                
                # log row
                self.logger.info(
                    table_borders.get("row_format").format(
                        *self.get_padded_log_columns(column_max_lengths, column_range, row)
                    ))

            self.logger.info(table_borders.get("footer"))
