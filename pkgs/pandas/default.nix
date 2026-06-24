{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  meson-python,
  meson,
  pkg-config,
  wheel,

  # propagates
  numpy,
  python-dateutil,
  pytz,
  tzdata,

  # optionals
  beautifulsoup4,
  fsspec,
  gcsfs,
  html5lib,
  jinja2,
  lxml,
  matplotlib,
  openpyxl,
  psycopg2 ? null,
  pyarrow ? null,
  pymysql,
  s3fs,
  scipy,
  sqlalchemy,
  tabulate,
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
    meson-python
    meson
    numpy
    pkg-config
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
        ];
        compression = [ zstandard ];
        computation = [
          scipy
        ];
        excel = [
          openpyxl
          xlrd
          xlsxwriter
        ];
        feather = lib.optionals (pyarrow != null) [ pyarrow ];
        fss = [ fsspec ];
        gcp = [
          gcsfs
        ];
        hdf5 = [
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
        parquet = lib.optionals (pyarrow != null) [ pyarrow ];
        performance = [
        ];
        plot = [ matplotlib ];
        postgresql = [
          sqlalchemy
        ] ++ lib.optionals (psycopg2 != null) [
          psycopg2
        ];
        spss = [ ];
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
