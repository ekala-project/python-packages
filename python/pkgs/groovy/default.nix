{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "groovy";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JcHcCbP51+KSRYqnYsa+uW6gNwcb9ekX/IH7eNIjEIM=";
  };

  build-system = [ hatchling ];

  # Tests require gradio and attempt to load a cert file
  doCheck = false;

  pythonImportsCheck = [ "groovy" ];

  meta = {
    description = "Small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks";
    homepage = "https://pypi.org/project/groovy";
    license = lib.licenses.asl20;
  };
}
