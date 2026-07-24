{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "prefixed";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FkQD+p68gygLvEcF9LJDoog34WQxC05lw4zKseuv7rM=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "prefixed" ];

  meta = {
    description = "Prefixed alternative numeric library";
    homepage = "https://github.com/Rockhopper-Technologies/prefixed";
    changelog = "https://github.com/Rockhopper-Technologies/prefixed/releases/tag/${version}";
    license = with lib.licenses; [ mpl20 ];
  };
}
