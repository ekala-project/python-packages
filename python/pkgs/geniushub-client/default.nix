{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "geniushub-client";
  version = "0.7.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "manzanotti";
    repo = "geniushub-client";
    tag = "v${version}";
    hash = "sha256-6jVLqOf9OmxynUOjEuOPI/Pvbv3NYAbWE3glwBAY4p8=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace 'VERSION = os.environ["GITHUB_REF_NAME"]' "" \
      --replace "version=VERSION," 'version="${version}",'
  '';

  dependencies = [ aiohttp ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "geniushubclient" ];

  meta = {
    description = "Module to interact with Genius Hub systems";
    homepage = "https://github.com/manzanotti/geniushub-client";
    license = lib.licenses.mit;
  };
}
