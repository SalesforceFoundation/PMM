from robot.libraries.BuiltIn import BuiltIn


class BasePMDMPage:

    @property
    def pmdm(self):
        return self.builtin.get_library_instance('PMDM')

    @property
    def pageobjects(self):
        return self.builtin.get_library_instance("cumulusci.robotframework.PageObjects")