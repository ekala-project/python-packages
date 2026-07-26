{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # dependencies
  decorator,

  # native dependencies
  krb5,
}:

buildPythonPackage (finalAttrs: {
  pname = "gssapi";
  version = "1.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pythongssapi";
    repo = "python-gssapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-E9rX5/7jTFR4nZ7ww2B083Tlz5vwl00yhakBQg75WZs=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython == 3.2.4" Cython
    substituteInPlace setup.py \
      --replace-fail 'get_output(f"{kc} gssapi --prefix")' '"${lib.getDev krb5}"'
  '';

  env = lib.optionalAttrs (!stdenv.buildPlatform.canExecute stdenv.hostPlatform) {
    GSSAPI_SUPPORT_DETECT = "false";
  };

  build-system = [
    cython
    krb5
    setuptools
  ];

  dependencies = [ decorator ];

  pythonImportsCheck = [ "gssapi" ];

  meta = {
    homepage = "https://github.com/pythongssapi/python-gssapi";
    description = "Python GSSAPI Wrapper";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
