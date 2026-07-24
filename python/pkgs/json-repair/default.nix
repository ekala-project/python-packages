{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "json-repair";
  version = "0.55.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mangiucugna";
    repo = "json_repair";
    tag = "v${version}";
    hash = "sha256-CzoGu6JNOaqdLZK4DyDUv+TMIA+k9AlZZy1fKnpMbkE=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "json_repair" ];

  meta = {
    description = "Module to repair invalid JSON, commonly used to parse the output of LLMs";
    homepage = "https://github.com/mangiucugna/json_repair/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "json_repair";
  };
}
