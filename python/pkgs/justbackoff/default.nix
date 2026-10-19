{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "justbackoff";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alexferl";
    repo = "justbackoff";
    tag = "v${version}";
    sha256 = "097j6jxgl4b3z46x9y9z10643vnr9v831vhagrxzrq6nviil2z6l";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "pytest-runner>=5.2" ""
  '';

  pythonImportsCheck = [ "justbackoff" ];

  meta = {
    description = "Simple backoff algorithm in Python";
    homepage = "https://github.com/alexferl/justbackoff";
    license = lib.licenses.mit;
  };
}
