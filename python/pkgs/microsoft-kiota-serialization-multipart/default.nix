{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  microsoft-kiota-abstractions,
  microsoft-kiota-serialization-json,
  pytest-asyncio,
  pytest-mock,
  gitUpdater,
}:

buildPythonPackage rec {
  pname = "microsoft-kiota-serialization-multipart";
  version = "1.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "kiota-python";
    tag = "microsoft-kiota-serialization-multipart-v${version}";
    hash = "sha256-J33Bxo9TwHRCPzDw/Jduo9HHxoofB5h/HsNX6R9FfFI=";
  };

  sourceRoot = "${src.name}/packages/serialization/multipart/";

  build-system = [ flit-core ];

  dependencies = [ microsoft-kiota-abstractions ];
  pythonImportsCheck = [ "kiota_serialization_multipart" ];

  passthru.updateScript = gitUpdater {
    rev-prefix = "microsoft-kiota-serialization-multipart-v";
  };

  meta = {
    description = "Multipart serialization implementation for Kiota clients in Python";
    homepage = "https://github.com/microsoft/kiota-python/tree/main/packages/serialization/multipart";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
