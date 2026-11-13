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
  pkgs, # krb5 is shadowed by python3Packages.krb5
}:

buildPythonPackage (finalAttrs: {
  pname = "gssapi";
  version = "1.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pythongssapi";
    repo = "python-gssapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LgIHMpMallfj5Or3f998jY9WvP9Ic6r5/EM5IbTuYEw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython == 3.3.0" Cython
    substituteInPlace setup.py \
      --replace-fail 'get_output(f"{kc} gssapi --prefix")' '"${lib.getDev pkgs.krb5}"'
  '';

  env = lib.optionalAttrs (!stdenv.buildPlatform.canExecute stdenv.hostPlatform) {
    GSSAPI_SUPPORT_DETECT = "false";
  };

  build-system = [
    cython
    pkgs.krb5
    setuptools
  ];

  dependencies = [ decorator ];

  pythonImportsCheck = [ "gssapi" ];

  meta = {
    homepage = "https://github.com/pythongssapi/python-gssapi";
    description = "Python GSSAPI Wrapper";
    license = lib.licenses.mit;
  };
})
