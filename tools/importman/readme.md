# Summary

This is a bulk data importer for BTrDB that will allow for the fast import of archived data in various formats. Currently, we support OpenHistorianV1 (.d) archives.

Please note that the documentation below may be out of date.


# Installing the ImportCLI Tool

0. Read this to get the paths correct - https://golang.org/doc/code.html
1. Ensure that you have Go 1.10 installed
2. Clone the repository (smartgridstore - https://github.com/BTrDB/smartgridstore)
3. Install dep 
4. Run "dep ensure" in the root of the repository to ensure you have the correct build environment
5. Change into the tools/importman/importcli directory and run go build

Note that you may have to install dep

`go get -u github.com/golang/dep/cmd/dep`



# Using the ImportCLI Tool 

First, you must ensure that the BTRDB_ENDPONTS variable is set.

```export BTRDB_ENDPOINTS=xxx.xxx.xxx.xxx:PPPP```


```./importcli --collection "baz/foo" importfiles --openhist_v1 ~/w/ppa_archive```


The import will be faster if you are on the same network as the BTrDB server and pass the kubernetes address (xxx.xxx.xxx.xxx) as the endpoint rather than going through apifrontend.


If you are importing data for existing streams (e.g you have run some import already) then you need tell the app by giving `--continue`:


```./importcli --continue --collection "baz/foo" importfiles --openhist_v1 ~/w/ppa_archive```

You can use shell expansion (e.g. file*)

```../importcli --collection "baz/foo" importfiles --openhist_v1 './archive_files'```

```~/go/src/smartgridstore/tools/importman/importcli/importcli --collection "collection_name" importfiles --metadata metadata_file.csv --openhist_v1 *.d```


The metadata columns must be in the following order:

```['id', 'include', 'collection', 'name', 'description', 'phase', 'units']```
