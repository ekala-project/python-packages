{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-ranged-response";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "11gr3jpmb5rvg3scv026kjwwkmnxwivgq5ypxadnnc9p58szy7zp";
  };

  build-system = [ setuptools ];

  # tests not included in PyPi package, github source is not up to date with 0.2.0

  dependencies = [ django ];

  meta = {
    description = "Modified FileResponse that returns `Content-Range` headers with the HTTP response, so browsers (read Safari 9+) that request the file, can stream the response properly";
    homepage = "https://github.com/wearespindle/django-ranged-fileresponse";
    license = lib.licenses.mit;
  };
})
