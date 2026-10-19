{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest,
  vcrpy,
}:

buildPythonPackage rec {
  pname = "pytest-vcr";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ktosiek";
    repo = "pytest-vcr";
    tag = version;
    sha256 = "1i6fin91mklvbi8jzfiswvwf1m91f43smpj36a17xrzk4gisfs6i";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ vcrpy ];

  # Tests are using an obsolete attribute 'config'
  # https://github.com/ktosiek/pytest-vcr/issues/43
  pythonImportsCheck = [ "pytest_vcr" ];

  meta = {
    description = "Integration VCR.py into pytest";
    homepage = "https://github.com/ktosiek/pytest-vcr";
    license = lib.licenses.mit;
  };
}
