{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  colored,
  pytestCheckHook,
  numpy,
  pandas,
}:

buildPythonPackage rec {
  pname = "ansitable";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ts0OLMuhxkAkZtnmpV+5Of7BUjmAO2J8irVM8u23DMk=";
  };

  build-system = [ hatchling ];

  dependencies = [ colored ];

  pythonImportsCheck = [ "ansitable" ];

  nativeCheckInputs = [
    pytestCheckHook
    numpy
    pandas
  ];

  meta = {
    description = "Quick and easy display of tabular data and matrices with optional ANSI color and borders";
    homepage = "https://pypi.org/project/ansitable/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
