{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
  urwid,
}:

buildPythonPackage (finalAttrs: {
  pname = "hachoir";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vstinner";
    repo = "hachoir";
    tag = finalAttrs.version;
    hash = "sha256-sTUJx8Xyhw4Z6juRtREw/okuVjSTSVWpSLKeZ7T8IR8=";
  };

  build-system = [ setuptools ];

  dependencies = [ urwid ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "hachoir" ];

  meta = {
    description = "Python library to view and edit a binary stream";
    homepage = "https://hachoir.readthedocs.io/";
    license = lib.licenses.gpl2Only;
  };
})
