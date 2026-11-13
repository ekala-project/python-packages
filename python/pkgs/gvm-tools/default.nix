{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  python-gvm,
}:

buildPythonPackage (finalAttrs: {
  pname = "gvm-tools";
  version = "26.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greenbone";
    repo = "gvm-tools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Pqhgfo0TaGZk9dz5yCQ3CP208rMKx/DxSIQdQ3I/Nvc=";
  };

  build-system = [ hatchling ];

  dependencies = [ python-gvm ];

  pythonImportsCheck = [ "gvmtools" ];

  meta = {
    description = "Collection of APIs that help with remote controlling a Greenbone Security Manager";
    homepage = "https://github.com/greenbone/gvm-tools";
    license = lib.licenses.gpl3Plus;
  };
})
