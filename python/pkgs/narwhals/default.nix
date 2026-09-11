{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  packaging,
  pandas,
  polars,
  pyarrow ? null,
  rich,
}:

buildPythonPackage rec {
  pname = "narwhals";
  version = "2.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "narwhals-dev";
    repo = "narwhals";
    tag = "v${version}";
    hash = "sha256-k7CeM8Q4JgKbkLisAaVrljro4diOf0K0immek6AI0vM=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    # cudf = [ cudf ];
    # dask = [ dask ] ++ dask.optional-dependencies.dataframe;
    # modin = [ modin ];
    pandas = [ pandas ];
    polars = [ polars ];
    pyarrow = lib.optionals (pyarrow != null) [ pyarrow ];
  };

  pythonImportsCheck = [ "narwhals" ];

  meta = {
    description = "Lightweight and extensible compatibility layer between dataframe libraries";
    homepage = "https://github.com/narwhals-dev/narwhals";
    license = lib.licenses.mit;
  };
}
