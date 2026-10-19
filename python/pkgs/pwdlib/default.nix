{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-regex-commit,
  pytest-cov-stub,
  argon2-cffi,
  bcrypt,
}:

buildPythonPackage (finalAttrs: {
  pname = "pwdlib";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "frankie567";
    repo = "pwdlib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-4fqdgeDtPZztaR2SzwpYjv3WjXcf/9qHKzNwm/muXm8=";
  };

  build-system = [
    hatchling
    hatch-regex-commit
  ];

  dependencies = [
    argon2-cffi
    bcrypt
  ];

  pythonImportsCheck = [ "pwdlib" ];
  meta = {
    description = "Modern password hashing for Python";
    homepage = "https://github.com/frankie567/pwdlib";
    license = lib.licenses.mit;
  };
})
