{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  microsoft-kiota-abstractions,
  pytest-asyncio,
  pytest-mock,
  python-dateutil,
  gitUpdater,
}:

buildPythonPackage rec {
  pname = "microsoft-kiota-serialization-text";
  version = "1.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "kiota-python";
    tag = "microsoft-kiota-serialization-text-v${version}";
    hash = "sha256-J33Bxo9TwHRCPzDw/Jduo9HHxoofB5h/HsNX6R9FfFI=";
  };

  sourceRoot = "${src.name}/packages/serialization/text/";

  build-system = [ flit-core ];

  dependencies = [
    microsoft-kiota-abstractions
    python-dateutil
  ];
  pythonImportsCheck = [ "kiota_serialization_text" ];

  passthru.updateScript = gitUpdater {
    rev-prefix = "microsoft-kiota-serialization-text-v";
  };

  meta = {
    description = "Text serialization implementation for Kiota generated clients in Python";
    homepage = "https://github.com/microsoft/kiota-python/tree/main/packages/serialization/text";
    license = lib.licenses.mit;
  };
}
