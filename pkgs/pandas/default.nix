{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython_3_1,
  meson-python,
  meson,
  pkg-config,
  versioneer,
  wheel,

  # propagates
  numpy,
  python-dateutil,
  pytz,
  tzdata,

  # optionals
  beautifulsoup4,
  bottleneck,
  blosc2,
  fsspec,
  gcsfs,
  html5lib,
  jinja2,
  lxml,
  matplotlib,
  numba,
  numexpr,
  odfpy,
  openpyxl,
  psycopg2,
  pyarrow,
  pymysql,
  pyqt5,
  pyreadstat,
  pyxlsb,
  qtpy,
  s3fs,
  scipy,
  sqlalchemy,
  tables,
  tabulate,
  xarray,
  xlrd,
  xlsxwriter,
  zstandard,
}:

buildPythonPackage rec {
  pname = "pandas";
  version = "2.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pandas-dev";
    repo = "pandas";
    tag = "v${version}";
    hash = "sha256-jY1uM9HmJzoFk26ilbtzJnxAsQhmXS19r73JcFeFWRQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "numpy>=2.0" numpy
  '';

  build-system = [
    cython_3_1
    meson-python
    meson
    numpy
    pkg-config
    versioneer
    wheel
  ];

  enableParallelBuilding = true;

  dependencies = [
    numpy
    python-dateutil
    pytz
    tzdata
  ];

  optional-dependencies =
    let
      extras = {
        aws = [ s3fs ];
        clipboard = [
          pyqt5
          qtpy
        ];
        compression = [ zstandard ];
        computation = [
          scipy
          xarray
        ];
        excel = [
          odfpy
          openpyxl
          pyxlsb
          xlrd
          xlsxwriter
        ];
        feather = [ pyarrow ];
        fss = [ fsspec ];
        gcp = [
          gcsfs
        ];
        hdf5 = [
          blosc2
          tables
        ];
        html = [
          beautifulsoup4
          html5lib
          lxml
        ];
        mysql = [
          sqlalchemy
          pymysql
        ];
        output_formatting = [
          jinja2
          tabulate
        ];
        parquet = [ pyarrow ];
        performance = [
          bottleneck
          numba
          numexpr
        ];
        plot = [ matplotlib ];
        postgresql = [
          sqlalchemy
          psycopg2
        ];
        spss = [ pyreadstat ];
        sql-other = [ sqlalchemy ];
        xml = [ lxml ];
      };
    in
    extras // { all = lib.concatLists (lib.attrValues extras); };

  doCheck = false;

  pythonImportsCheck = [ "pandas" ];

  meta = {
    description = "Powerful data structures for data analysis, time series, and statistics";
    downloadPage = "https://github.com/pandas-dev/pandas";
    homepage = "https://pandas.pydata.org";
    license = lib.licenses.bsd3;
    longDescription = ''
      Flexible and powerful data analysis / manipulation library for
      Python, providing labeled data structures similar to R data.frame
      objects, statistical functions, and much more.
    '';
  };
}
