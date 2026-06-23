{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch2,
  hatchling,
  packaging,
  pandas,
  polars,
  pyarrow-hotfix,
  pyarrow,
  pyspark,
  dask,
  ibis-framework,
  rich,
  sqlframe,
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

  patches = [
    (fetchpatch2 {
      name = "fix-dask-deprecationwarning.patch";
      url = "https://github.com/narwhals-dev/narwhals/commit/254655af21872e8127f7fee9a9afbfb279f1eda2.patch?full_index=1";
      # Exclude unrelated change to non-test code.
      includes = [ "pyproject.toml" ];
      hash = "sha256-tgz0b08P36CENOYFBILbicHhdB4BytXgFQk3nIxpw0A=";
    })
    (fetchpatch2 {
      name = "fix-dask-deprecationwarning.patch";
      url = "https://github.com/narwhals-dev/narwhals/commit/b92d5a840e08bdf7806947ffde27de856900c5ab.patch?full_index=1";
      hash = "sha256-2lct6/MfViKnRjpEehNKqF6zdZVIkXi7tYxycDh/Hn8=";
    })
    (fetchpatch2 {
      name = "ignore-polars-deprecation-warning-in-tests.patch";
      url = "https://github.com/narwhals-dev/narwhals/commit/fb798716eb5f8835096d8f88d422baae2b22b3ce.patch?full_index=1";
      hash = "sha256-pWi0y4S48aADJ1MA3kB9FsLuoA+HfZp5+AgEn69pUuA=";
    })
  ];

  build-system = [ hatchling ];

  optional-dependencies = {
    # cudf = [ cudf ];
    dask = [ dask ] ++ dask.optional-dependencies.dataframe;
    # modin = [ modin ];
    pandas = [ pandas ];
    polars = [ polars ];
    pyarrow = [ pyarrow ];
    pyspark = [ pyspark ];
    ibis = [
      ibis-framework
      rich
      packaging
      pyarrow-hotfix
    ];
    sqlframe = [ sqlframe ];
  };

  pythonImportsCheck = [ "narwhals" ];

  meta = {
    description = "Lightweight and extensible compatibility layer between dataframe libraries";
    homepage = "https://github.com/narwhals-dev/narwhals";
    license = lib.licenses.mit;
  };
}
