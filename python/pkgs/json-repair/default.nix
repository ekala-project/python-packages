{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "json-repair";
  version = "0.63.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mangiucugna";
    repo = "json_repair";
    tag = "v${version}";
    hash = "sha256-VRRtL8X9egdqdz6Celw1CGGTuWd9YMVbq/uHwHtmv64=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "json_repair" ];

  meta = {
    description = "Module to repair invalid JSON, commonly used to parse the output of LLMs";
    homepage = "https://github.com/mangiucugna/json_repair/";
    license = lib.licenses.mit;
    mainProgram = "json_repair";
  };
}
