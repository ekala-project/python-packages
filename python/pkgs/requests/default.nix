{
  lib,
  stdenv,
  buildPythonPackage,
  certifi,
  chardet,
  charset-normalizer,
  fetchFromGitHub,
  idna,
  pysocks,
  setuptools,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests";
  version = "2.34.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "psf";
    repo = "requests";
    tag = "v${finalAttrs.version}";
    hash = "sha256-J2/sNpFUDHkNBeN7BfiMamv7YaWixZAZHxaqmPVEptc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certifi
    charset-normalizer
    idna
    urllib3
  ];

  optional-dependencies = {
    security = [ ];
    socks = [ pysocks ];
    use_chardet_on_py3 = [ chardet ];
  };
  disabledTestPaths = lib.optionals (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64) [
    # Fatal Python error: Aborted
    "tests/test_lowlevel.py"
  ];

  pythonImportsCheck = [ "requests" ];
  meta = {
    description = "HTTP library for Python";
    homepage = "http://docs.python-requests.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
