{
  lib,
  buildPythonPackage,
  fetchurl,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "gdata";
  version = "2.0.18";
  pyproject = true;

  src = fetchurl {
    url = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gdata-python-client/${pname}-${finalAttrs.version}.tar.gz";
    sha256 = "1dpxl5hwyyqd71avpm5vkvw8fhlvf9liizmhrq9jphhrx0nx5rsn";
  };

  build-system = [ setuptools ];

  # Fails with "error: invalid command 'test'"

  meta = {
    homepage = "https://github.com/google/gdata-python-client";
    description = "Python client library for Google data APIs";
    license = lib.licenses.asl20;
  };
})
