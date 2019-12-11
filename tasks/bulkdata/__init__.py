from tasks.bulkdata.delete import DeleteData
from tasks.bulkdata.extract import ExtractData
from tasks.bulkdata.generate_mapping import GenerateMapping
from tasks.bulkdata.load import LoadData
from tasks.bulkdata.generate_and_load_data import GenerateAndLoadData

# For backwards-compatibility
QueryData = ExtractData
__all__ = (
    "DeleteData",
    "ExtractData",
    "GenerateMapping",
    "LoadData",
    "GenerateAndLoadData",
)
