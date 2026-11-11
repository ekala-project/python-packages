{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "alibabacloud-gateway-oss-util";
  version = "0.0.14";
  pyproject = true;

  src = fetchPypi {
    pname = "alibabacloud_gateway_oss_util";
    inherit (finalAttrs) version;
    hash = "sha256-OHOjPeo3RKaFvnctxK00XmlGZSMVU5kozIY3S3vfy50=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "alibabacloud_gateway_oss_util" ];

  # Module has no tests

  meta = {
    description = "Alibaba Cloud OSS Util Library for Python";
    homepage = "https://pypi.org/project/alibabacloud-gateway-oss-util/";
    license = lib.licenses.asl20;
  };
})
