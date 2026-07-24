{
  lib,
  buildPythonPackage,
  fetchPypi,
  markuppy,
  odfpy,
  openpyxl,
  pandas,
  pytest-cov-stub,
  pyyaml,
  setuptools-scm,
  tabulate,
  unicodecsv,
  xlrd,
  xlwt,
}:

buildPythonPackage rec {
  pname = "tablib";
  version = "3.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-G2q9jtsPNWAeBMYWHXlmD9zeSrtKVPZsyfkFS9VdX+I=";
  };

  nativeBuildInputs = [ setuptools-scm ];

  optional-dependencies = {
    all = [
      markuppy
      odfpy
      openpyxl
      pandas
      pyyaml
      tabulate
      xlrd
      xlwt
    ];
    cli = [ tabulate ];
    html = [ markuppy ];
    ods = [ odfpy ];
    pandas = [ pandas ];
    xls = [
      xlrd
      xlwt
    ];
    xlsx = [ openpyxl ];
    yaml = [ pyyaml ];
  };
  pythonImportsCheck = [ "tablib" ];

  meta = {
    description = "Format-agnostic tabular dataset library";
    homepage = "https://tablib.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
