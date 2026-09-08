{
  lib,
  stdenv,
  buildPythonPackage,
  build,
  click,
  fetchFromGitHub,
  fetchpatch,
  pip,
  pyproject-hooks,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage rec {
  pname = "pip-tools";
  version = "7.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "pip-tools";
    tag = "v${version}";
    hash = "sha256-gh1oe4Ghz492LofyT2ZLRBuQ9DKn+tYVc2EpkWJ4bfc=";
  };

  patches = [
    ./fix-setup-py-bad-syntax-detection.patch
  ];

  build-system = [ setuptools-scm ];

  dependencies = [
    build
    click
    pip
    pyproject-hooks
    setuptools
    wheel
  ];
  preCheck = lib.optionalString (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64) ''
    # https://github.com/python/cpython/issues/74570#issuecomment-1093748531
    export no_proxy='*';
  '';
  pythonImportsCheck = [ "piptools" ];

  meta = {
    description = "Keeps your pinned dependencies fresh";
    homepage = "https://github.com/jazzband/pip-tools/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
