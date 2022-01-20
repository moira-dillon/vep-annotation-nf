params.outputDir = "output"

// ~~~~~ START WORKFLOW ~~~~~ //
log.info "~~~~~~~ VEP Pipeline ~~~~~~~"
log.info "* Project dir:        ${workflow.projectDir}"
log.info "* Launch dir:         ${workflow.launchDir}"
log.info "* Work dir:           ${workflow.workDir.toUriString()}"
log.info "* Profile:            ${workflow.profile ?: '-'}"
log.info "* Script name:        ${workflow.scriptName ?: '-'}"
log.info "* Script ID:          ${workflow.scriptId ?: '-'}"
log.info "* Container engine:   ${workflow.containerEngine?:'-'}"
log.info "* Workflow session:   ${workflow.sessionId}"
log.info "* Nextflow run name:  ${workflow.runName}"
log.info "* Nextflow version:   ${workflow.nextflow.version}, build ${workflow.nextflow.build} (${workflow.nextflow.timestamp})"
log.info "* Launch command:\n${workflow.commandLine}\n"

//Channel.fromPath( file(params.ref_fa) )
//.into{ ref_fa;
//    ref_fa2
//}

//Channel.fromPath( file(params.ref_fai) )
//.into{ ref_fai;
//ref_fai2
//}

//Channel.fromPath( file(params.ref_dict) )
//.into{ ref_dict;
//    ref_dict2
//}

Channel.fromPath("../alpha1_1000_0.vcf.gz").map { item ->
    def sampleID = "${item.getName()}".replaceFirst(/.vcf$/, "")
    return([sampleID, item])
}.set { input_vcfs }
