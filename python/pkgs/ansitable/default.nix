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

buildPythonPackage (finalAttrs: {
  pname = "ansitable";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-baf/GemGygLLZK3f2Nv7qLYQVP/44O/kWLeP0KLZyhs=";
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
  };
})
