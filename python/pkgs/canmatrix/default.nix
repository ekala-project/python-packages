{ lib
, attrs
, buildPythonPackage
, click
, fetchFromGitHub
, ldfparser
, lxml
, openpyxl
, pyyaml
, setuptools
, xlrd
, xlwt
,
}:

buildPythonPackage rec {
  pname = "canmatrix";
  version = "1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ebroecker";
    repo = "canmatrix";
    tag = version;
    hash = "sha256-PfegsFha7ernSqnMeaDoLf1jLx1CiOoiYi34dESEgBY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    click
  ];

  optional-dependencies = {
    arxml = [ lxml ];
    fibex = [ lxml ];
    kcd = [ lxml ];
    ldf = [ ldfparser ];
    odx = [ lxml ];
    xls = [
      xlrd
      xlwt
    ];
    xlsx = [ openpyxl ];
    yaml = [ pyyaml ];
  };

  pythonImportsCheck = [ "canmatrix" ];

  meta = {
    description = "Support and convert several CAN (Controller Area Network) database formats";
    homepage = "https://github.com/ebroecker/canmatrix";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
