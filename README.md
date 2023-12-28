# What and Why Azure Pipelines?

Azure Pipelines, a vital Azure DevOps feature, streamlines the development process. This cloud-based service specializes in automating the coding lifecycle, ensuring efficiency in building, testing, and deploying projects. It stands out for its support for a wide range of programming languages and project frameworks.

## Key aspects of Azure Pipelines include:

- **Seamless integration** with various languages and platforms, promoting versatility.
- **Simultaneous deployment** across multiple environments, enhancing productivity.
- **Integration with Azure services**, ensuring a cohesive workflow.
- **Compatibility with Windows, Linux, and macOS**, offering cross-platform support.
- **GitHub connectivity**, facilitating collaboration and open-source contribution.
- **A focus on continuous integration, delivery, and testing**, aiming for consistent and superior quality in code development.

In essence, Azure Pipelines is designed to provide a fast, straightforward, and secure method for automating project creation, thereby delivering high-quality code that is readily available to users.

## Prerequisites:

- **Azure Account:** Ensure you have an active Azure account.
- **Organization & Project Setup:** Create a new organization and project within Azure.
- **Service Connections:** Establish connections with essential services like AWS, GitHub, and Terraform.
- **Fork GitHub Repo:** Clone the repository ModulesCICD from GitHub.
- **AWS Account:** Secure access to an AWS account.
- **S3 Bucket Creation:** Set up an S3 bucket in AWS, designated for storing Terraform state files.

## How to Create Environment in Azure DevOps

### Step 1 — Accessing the Pipeline Creation Interface

Begin by opening your Azure DevOps project. On the left-hand side of the interface, locate and click on the ‘Pipelines’ option. This action will redirect you to the pipeline management area. Here, click on the ‘Create Pipeline’ button. This step is pivotal as it initiates the process of building a new pipeline, which is a key component in automating your code integration and deployment processes.
<img width="705" alt="Screenshot 2023-12-28 at 3 47 58 PM" src="https://github.com/oluakinbinu/ModulesCICD/assets/154087956/02e17d5f-5c93-4b67-b98a-16e1fc222246">

### Step 2 - Repository Selection and Integration

Next, you will be prompted with the question, "Where is your code?". Select 'GitHub' from the available options. This step involves choosing the repository hosting your project's codebase and integrating it with Azure Pipelines for continuous integration and delivery.
<img width="687" alt="Screenshot 2023-12-28 at 3 50 22 PM" src="https://github.com/oluakinbinu/ModulesCICD/assets/154087956/2f6f55d4-1b0e-46af-a509-31ebb7f05240">

### Selecting the Forked Repository

Prior to this step, ensure that your GitHub account is properly linked to your Azure DevOps account for seamless integration. Once the connection is established, Azure DevOps will display a list of all your GitHub repositories. At this point, it is essential to have already forked the specific GitHub repository you intend to use, which in this case is `ModulesCICD`.

Navigate through the list of repositories, locate the `ModulesCICD` repository, and select it. This action is crucial as it determines the source code that your new pipeline will build, test, and deploy.
<img width="705" alt="Screenshot 2023-12-28 at 3 51 06 PM" src="https://github.com/oluakinbinu/ModulesCICD/assets/154087956/c224d90a-098f-4c34-a24e-4e1ebbb94389">

Select Starter Pipeline

![image](https://github.com/oluakinbinu/ModulesCICD/assets/154087956/b611ae0b-7dcc-40d0-8c8d-ccd958e816ad)

### Implementing the YAML Template for Pipeline Configuration:

In this phase of the pipeline setup, you will insert a predefined YAML template into Azure DevOps. This YAML script serves as the blueprint for your pipeline's behavior. It begins with a trigger section, specifying that the pipeline will activate on changes to the 'main' branch. The resources section indicates that the pipeline will use the current repository ('self') hosted in Git, specifically targeting the 'main' branch.
The stages outlined in the YAML are structured to perform specific tasks. The 'Build' stage contains jobs that execute the build process. Within this stage, a job named 'BuildRepo' is defined, and designated to build the repository. This job operates on a 'windows-2019' virtual machine image and includes steps such as checking out the code, ensuring a clean workspace, and not fetching tags to optimize the build process.
The subsequent tasks in the YAML include copying files to the 'Build.ArtifactStagingDirectory' and publishing build artifacts. The 'CopyFiles@2' task efficiently transfers necessary files to a specified target folder, while the 'PublishBuildArtifacts@1' task is responsible for making the build artifacts available, labeled as 'drop'. This structured approach ensures a streamlined and automated process for building and managing artifacts in your Azure DevOps pipeline.

```yaml
trigger:
- main

resources:
  repositories:
  - repository: self
    type: git
    ref: main

stages:
  - stage: Build
    jobs:
      - job: BuildRepo
        displayName: 'Build Repository'

        pool:
          vmImage: 'windows-2019'

        steps:
          - checkout: self
            clean: true
            fetchTags: false

          - task: CopyFiles@2
            displayName: 'Copy Files to: $(Build.ArtifactStagingDirectory)'
            inputs:
              TargetFolder: '$(Build.ArtifactStagingDirectory)'

          - task: PublishBuildArtifacts@1
            displayName: 'Publish Artifact: drop'
```








