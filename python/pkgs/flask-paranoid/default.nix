{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  flask,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-paranoid";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "miguelgrinberg";
    repo = "flask-paranoid";
    tag = "v${finalAttrs.version}";
    hash = "sha256-tikD8efc3Q3xIQnaC3SSBaCRQxMI1HzXxeupvYeNnE4=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # tests have a typo in one of the assertions
    substituteInPlace tests/test_paranoid.py --replace "01-Jan-1970" "01 Jan 1970"
  '';

  dependencies = [ flask ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "flask_paranoid" ];

  meta = {
    homepage = "https://github.com/miguelgrinberg/flask-paranoid/";
    description = "Simple user session protection";
    license = lib.licenses.mit;
  };
})
