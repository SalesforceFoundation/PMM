from robot.libraries.BuiltIn import BuiltIn


class BasePMMPage:
    @property
    def pmm(self):
        return self.builtin.get_library_instance("PMM")

    @property
    def pageobjects(self):
        return self.builtin.get_library_instance("cumulusci.robotframework.PageObjects")
