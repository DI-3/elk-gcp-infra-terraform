variable "gke_num_nodes" {
    default = 5
    description = "number of gke nodes"
}

#GKE Cluster
resource "google_container_cluster" "primary" {
    name = "${var.project_id}-gke"
    location = "${var.region}"


    remove_default_node_pool = true
    initial_node_count = 1 

    network = "universal-valve-bucket-373803-vpc"
    subnetwork = "universal-valve-bucket-373803-vpc-subnet"
}


resource "google_container_node_pool" "primary_nodes" {
    name = "${var.project_id}-gke"
    location = "${var.region}"
    cluster = "${var.project_id}-gke"
    node_count = var.gke_num_nodes

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    
        labels = {
            env = var.project_id
        }

        # preemptible  = true
        machine_type = "n1-standard-1"
        tags         = ["gke-node", "${var.project_id}-gke"]
        metadata = {
        disable-legacy-endpoints = "true"
        }
    }
}