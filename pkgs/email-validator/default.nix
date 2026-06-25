{
  lib,
  buildPythonPackage,
  dnspython,
  fetchPypi,
  idna,
}:

buildPythonPackage rec {
  pname = "email-validator";
  version = "2.3.0";
  format = "setuptools";

  src = fetchPypi {
    pname = "email_validator";
    inherit version;
    hash = "sha256-n8BcN/L2z0Of9BT4/EbZF5KZdKgiRMIOsQIxumDFRCY=";
  };

  dependencies = [
    dnspython
    idna
  ];

  pythonImportsCheck = [ "email_validator" ];

  meta = {
    description = "Email syntax and deliverability validation library";
    mainProgram = "email_validator";
    homepage = "https://github.com/JoshData/python-email-validator";
    license = lib.licenses.cc0;
  };
}
