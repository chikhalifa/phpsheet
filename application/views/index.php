<!DOCTYPE html>
<html lang="en">

<head>
 <title>Home Page</title>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  </head>
<section class="content">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Upload</h3>
            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse"> <i class="fas fa-minus"></i>
                </button>
                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove"> <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
        <div class="card-body">
            <form id="form-upload-user" method="post" autocomplete="off">
                <div class="sub-result"></div>
                <div class="form-group">
                    <label class="control-label">Choose File <small class="text-danger">*</small></label>
                    <input type="file" class="form-control form-control-sm" id="file" name="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" required>
                    <small class="text-danger">Upload excel or csv file only.</small>
                    </div>
                <div class="form-group">
                    <div class="text-center">
                        <div class="user-loader" style="display: none; ">
                            <i class="fa fa-spinner fa-spin"></i> <small>Please wait ...</small>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btnUpload">Upload</button>
                </div>
            </form>
        </div>
    </div>
</section>
</html>

<!-- /.content -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $("body").on("submit", "#form-upload-user", function(e) {
            e.preventDefault();
            var data = new FormData(this);
            $.ajax({
                type: 'POST',
                url: "<?php echo base_url('home/import') ?>",
                data: data,
                dataType: 'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend: function() {
                    $("#btnUpload").prop('disabled', true);
                    $(".user-loader").show();
                }, 
                success: function(result) {
                    $("#btnUpload").prop('disabled', false);
                    if($.isEmptyObject(result.error_message)) {
                        $(".result").html(result.success_message);
                    } else {
                        $(".sub-result").html(result.error_message);
                    }
                    $(".user-loader").hide();
                }
            });
        });
    });
</script>