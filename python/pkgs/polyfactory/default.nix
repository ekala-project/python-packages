{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  hatchling,

  # dependencies
  aiosqlite,
  email-validator,
  faker,
  hypothesis,
  msgspec,
  pydantic,
  pymongo,
  sqlalchemy,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "polyfactory";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "litestar-org";
    repo = "polyfactory";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KcruZTaCUHalfQtaJmj3BHF220Ccd3LKn+my/LuYroI=";
  };

  build-system = [ hatchling ];

  dependencies = [
    aiosqlite
    email-validator
    faker
    hypothesis
    msgspec
    pydantic
    pymongo
    sqlalchemy
    typing-extensions
  ];
  pythonImportsCheck = [ "polyfactory" ];

  meta = {
    homepage = "https://polyfactory.litestar.dev/";
    platforms = lib.platforms.unix;
    maintainers = [ ];
    description = "Simple and powerful factories for mock data generation";
    license = lib.licenses.mit;
  };
})
