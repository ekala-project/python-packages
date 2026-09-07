{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "disposable-email-domains";
  version = "0.0.252";
  pyproject = true;
  __structuredAttrs = true;

  # No tags on GitHub
  src = fetchPypi {
    pname = "disposable_email_domains";
    inherit (finalAttrs) version;
    hash = "sha256-nniJkGI7TSHLzFGFhKJydqQ5wtRXU8Z9d2KiuzQnEfs=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "disposable_email_domains" ];
  meta = {
    description = "Set of disposable email domains";
    homepage = "https://github.com/disposable-email-domains/disposable-email-domains";
    license = lib.licenses.cc0;
    maintainers = [ ];
  };
})
