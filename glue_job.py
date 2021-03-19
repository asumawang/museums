from pyspark.context import SparkContext
from awsglue.context import GlueContext

glueContext = GlueContext(SparkContext.getOrCreate())

# Data Catalog: database and table name
db_name = "museums"
tbl_name = "input"

# S3 location for output
output_dir = "s3://museum-directory-test/results/"

# Read data into a DynamicFrame using the Data Catalog metadata
museum_dyf = glueContext.create_dynamic_frame.from_catalog(database = db_name, table_name = tbl_name)

museum_dyf = museum_dyf.select_fields(["museum id", "museum type", "city (administrative location)", "state (administrative location)"])

museum_dyf = museum_dyf.apply_mapping([('museum id', 'long', 'museum_id', 'long'), 
                             ('museum type', 'string', 'museum_type', 'string'),
                             ('city (administrative location)', 'string', 'city_administrative_location', 'string'),
                             ('state (administrative location)', 'string', 'state_administrative_location', 'string')])

# Write it out in Parquet
glueContext.write_dynamic_frame.from_options(frame = museum_dyf, connection_type = "s3", connection_options = {"path": output_dir}, format = "parquet")