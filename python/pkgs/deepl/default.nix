{
  lib,
  buildPythonPackage,
  fetchPypi,
  requests,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "deepl";
  version = "1.33.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3ewzD8e2F0BhMf7YETf9O7Q9G64D7L1IyLjpy1hR4wM=";
  };

  nativeBuildInputs = [ poetry-core ];

  dependencies = [
    requests
  ];

  # Requires internet access and an API key

  pythonImportsCheck = [ "deepl" ];

  meta = {
    description = "Language translation API that allows other computer programs to send texts and documents to DeepL's servers and receive high-quality translations";
    mainProgram = "deepl";
    homepage = "https://github.com/DeepLcom/deepl-python";
    license = lib.licenses.mit;
  };
})
