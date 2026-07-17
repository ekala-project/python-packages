{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fonttools,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "arabic-reshaper";
  version = "3.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mpcabd";
    repo = "python-arabic-reshaper";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6i/YcYod341bg9tThZRwvaFRbtU/LxCeirq0yzmMuBI=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    with-fonttools = [ fonttools ];
  };

  pythonImportsCheck = [ "arabic_reshaper" ];

  meta = {
    description = "Reconstruct Arabic sentences to be used in applications that don't support Arabic";
    homepage = "https://github.com/mpcabd/python-arabic-reshaper";
    license = lib.licenses.mit;
  };
})
