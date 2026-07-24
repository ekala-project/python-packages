{
  lib,
  boto3,
  buildPythonPackage,
  cryptography,
  django,
  fetchFromGitHub,
  hatchling,
  idna,
  mock,
  pytest-django,
  requests,
  responses,
  urllib3,
}:

buildPythonPackage rec {
  pname = "django-anymail";
  version = "15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "anymail";
    repo = "django-anymail";
    tag = "v${version}";
    hash = "sha256-SAiHjVFh0x1lXoxAlU+Lpfzv9pndsz/V9AVWwyKehEo=";
  };

  build-system = [ hatchling ];

  dependencies = [
    django
    idna
    requests
    urllib3
  ];

  optional-dependencies = {
    amazon-ses = [ boto3 ];
    postal = [ cryptography ];
    sendgrid = [ cryptography ];
    # not packaged
    # resend = [ svix ];
    # uts46 = [ uts46 ];
  };
  disabledTestMarks = [ "live" ];
  pythonImportsCheck = [ "anymail" ];

  meta = {
    description = "Django email backends and webhooks for Mailgun";
    homepage = "https://github.com/anymail/django-anymail";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
