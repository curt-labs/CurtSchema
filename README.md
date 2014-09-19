CurtSchema
==========

This repository aims to centralize database schema files used by the Drone.io Continuous Integration (CI) server, which plays a very important part in how we are doing integration testing.

Prior to centralizing these files, there were data structure/consistency problems in the schema files. Some of these issues were: mismatched datatypes of columns, missing tables altogether, etc.

Note: CurtDev_Empty and admin_Empty appear to be duplicates at first glance, but they are different in that they use MyISAM versus InnoDB. MyISAM is used for full-text mysql functionality. v2Mock is the only project that uses these files (part power search functionality), so in the near future we will need to rewrite this in order to ensure schema consistency across all projects.
