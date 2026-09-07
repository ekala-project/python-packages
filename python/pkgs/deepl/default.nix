{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "deepl";
  version = "1.32.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MBa/hvH1Prbl/ttFh0bGv2V5qEC1fFSi7XAbA0S8eeE=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    requests
  ];

  # Requires internet access and an API key
  doCheck = false;

  pythonImportsCheck = [ "deepl" ];

  meta = {
    description = "Language translation API that allows other computer programs to send texts and documents to DeepL's servers and receive high-quality translations";
    mainProgram = "deepl";
    homepage = "https://github.com/DeepLcom/deepl-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
