{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pylint,
  toml,
}:

buildPythonPackage rec {
  pname = "pylint-plugin-utils";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "pylint-plugin-utils";
    tag = version;
    hash = "sha256-8C6vJDu60uSb6G0kvwiO0RAY9dU0yf955mAJAKhIkaQ=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pylint
    toml
  ];

  pythonImportsCheck = [ "pylint_plugin_utils" ];

  meta = {
    description = "Utilities and helpers for writing Pylint plugins";
    homepage = "https://github.com/PyCQA/pylint-plugin-utils";
    license = lib.licenses.gpl2Only;
  };
}
