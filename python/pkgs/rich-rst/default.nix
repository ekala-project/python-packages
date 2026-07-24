{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pygments,
  rich,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rich-rst";
  version = "2.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wasi-master";
    repo = "rich-rst";
    tag = "v${finalAttrs.version}";
    hash = "sha256-M4ngZNYPasEqqfRay8aGHDII+LkwLhBp5kF9ryJ5LwQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pygments
    rich
  ];

  pythonImportsCheck = [ "rich_rst" ];

  meta = {
    description = "Beautiful reStructuredText renderer for rich";
    homepage = "https://github.com/wasi-master/rich-rst";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
