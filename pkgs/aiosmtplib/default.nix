{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiosmtplib";
  version = "5.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cole";
    repo = "aiosmtplib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IAWMs4LBfVDMLxgPBnXrHQQ/8yhBYjvd4Fi4k0F19o0=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "aiosmtplib" ];

  meta = {
    description = "Module which provides a SMTP client";
    homepage = "https://github.com/cole/aiosmtplib";
    changelog = "https://github.com/cole/aiosmtplib/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
  };
})
