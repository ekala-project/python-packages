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
  version = "7.5.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "pip-tools";
    tag = "v${version}";
    hash = "sha256-MkYGD/ropw+MLLrk4gRZZguOv5extzNNXwTy6NQnCu0=";
  };

  patches = [
    ./fix-setup-py-bad-syntax-detection.patch

    (fetchpatch {
      name = "pip-26-compat.patch";
      url = "https://github.com/jazzband/pip-tools/commit/cbe3c692f8977270e7ae6061c8159450a73c13fe.patch";
      excludes = [
        "changelog.d/2379.feature.md"
        "pyproject.toml"
        "tox.ini"
      ];
      hash = "sha256-wDma1FBnWnrRln0o7HaizMIkoQey6VdQzGh+q84cHxE=";
    })
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
