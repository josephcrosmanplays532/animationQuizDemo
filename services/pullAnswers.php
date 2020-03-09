<?php
session_start();
$connType = "PDO";
require("../connect.php");
?>

<form>
    <div class="form-group row">
        <div class = "col-sm-12 col-md-12">
            <table class="table tabresponsive">
                <thead>
                    <tr>
                        <th>Question Number</th>
                        <th>User Name</th>
                        <th>Always</th>
                        <th>Very Often</th>
                        <th>Sometimes</th>
                        <th>Almost Never</th>
                        <th>Never(pops up)</th>
                    </tr>
                </thead>
                <tbody id="pullquizans">
                <?php 
                $uid = $_POST["userid"];
                // var_dump($uid);

                $sql = "SELECT q.id,a.user_id,u.fname,u.lname, a.ans_value,a.timestamp FROM fb_qs as q LEFT JOIN fb_ans as a on q.id = a.q_id LEFT join users as u on a.user_id = u.id WHERE a.user_id = ?";

                $stmt= $conn->prepare($sql);
                // $stmt->execute([$_SESSION["userid"]]);
                $stmt->execute([$uid]);
                // var_dump($stmt);
                $result=$stmt->fetchAll(PDO::FETCH_ASSOC);

                if($result){
                    //  echo json_encode($result);
                    foreach($result as $row){
                    //  var_dump($row) ;

                        echo '<tr>';
                        echo '<td>'.$row["id"].'</td>';
                        echo '<td>'.$row["fname"].'</td>';

                        if($row["ans_value"]=="Always"){
                        echo '<td><label><input type="radio" disabled  name="optradio'.$row["id"].'" checked></label></td>';
                        }else {
                            echo '<td><label><input type="radio" disabled name="optradio'.$row["id"].'"></label></td>';
                        }
                        if($row["ans_value"]=="Very Often"){
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                        }else {
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                        }
                        if($row["ans_value"]=="Sometimes"){
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                        }else {
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                        }
                        if($row["ans_value"]=="Almost Never"){
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                        }else {
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"> </label></td>';
                        }
                        if($row["ans_value"]=="Never (pops up)"){
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'" checked></label></td>';
                        }else {
                        echo '<td><label><input type="radio"  disabled name="optradio'.$row["id"].'"></label></td>';
                        }
                        echo '</tr>';
                    }
                    } else {
                    echo "<tr><td colspan='7' style='text-align:center;font-size: xx-large;' class='redColor'>No Quiz Submissions yet!!! </td></tr>";
                    }
                ?>
                </tbody>
            </table>
            <input id="resetID" value =<?php echo $uid; ?> type="hidden"/>
        </div>    
    </div>
    <div style="text-align: center;padding-bottom: 30px;">
        <button id="resetQuizAnswers" onclick="resetQuiz()" type="button"   class="btn btn-success" type="button" > RESET QUIZ </button>
    </div>
</form>