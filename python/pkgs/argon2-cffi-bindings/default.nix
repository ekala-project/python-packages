{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cmake,
  ninja,
  libargon2,
  cffi,
  scikit-build-core,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "argon2-cffi-bindings";
  version = "26.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hynek";
    repo = "argon2-cffi-bindings";
    tag = version;
    hash = "sha256-1938M2ALMcAIdTYTHCmJIAW1YyJPYhewZXOyFIJg/ZY=";
  };

  dontUseCmakeConfigure = true;

  buildInputs = [ libargon2 ];

  build-system = [
    cmake
    ninja
    scikit-build-core
    setuptools-scm
  ];

  dependencies = [ cffi ];

  env.ARGON2_CFFI_USE_SYSTEM = 1;

  pythonImportsCheck = [ "_argon2_cffi_bindings" ];

  meta = {
    description = "Low-level CFFI bindings for Argon2";
    homepage = "https://github.com/hynek/argon2-cffi-bindings";
    license = lib.licenses.mit;
  };
}
