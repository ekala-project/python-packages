{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uv-build,
  pytestCheckHook,
  colorama,
}:

buildPythonPackage (finalAttrs: {
  pname = "ansimarkup";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gvalkov";
    repo = "python-ansimarkup";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nM0XalJm7/PwjSj9imw1yYjfdwofV2bcA/jsjIibsEI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.29,<0.10.0" uv_build
  '';

  build-system = [ uv-build ];

  dependencies = [ colorama ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "ansimarkup" ];

  meta = {
    description = "XML-like markup for producing colored terminal text";
    homepage = "https://github.com/gvalkov/python-ansimarkup";
    license = lib.licenses.bsd3;
  };
})
