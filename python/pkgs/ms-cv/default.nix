{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "ms-cv";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "OpenXbox";
    repo = "ms_cv";
    tag = "v${version}";
    sha256 = "0pkna0kvmq1cp4rx3dnzxsvvlxxngryp77k42wkyw2phv19a2mjd";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "pytest-runner" ""
  '';

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Correlation vector implementation in python";
    homepage = "https://github.com/OpenXbox/ms_cv";
    license = lib.licenses.mit;
  };
}
