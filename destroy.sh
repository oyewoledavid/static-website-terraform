# Generate a list of all resources
resources=$(terraform state list)

# Specify the resource to exclude
exclude="aws_route53_zone.primary"

# Loop through the list and destroy each one, except the excluded resource
for resource in $resources; do
    if [ "$resource" != "$exclude" ]; then
        terraform destroy -target="$resource" -auto-approve
    fi
done