param(
	[ArgumentCompletions(
		'amazonlinux:2',
		'public.ecr.aws/amazonlinux/amazonlinux:2'
	)]
	[string]
	$BaseImage = 'public.ecr.aws/amazonlinux/amazonlinux:2'
)

$params = @(
	'--tag', 'amazonlinux:ec2-user'
	'--build-arg', "BASE_IMAGE=$BaseImage"
)
docker build @params .
