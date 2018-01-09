<template>
    <div style="width:100%;">
        <dbheader></dbheader>
        <dbsns></dbsns>
        <wrapper></wrapper>
    </div>
</template>
<script>
import Dbheader from '@/components/db/Dbheader';
import Dbsns from '@/components/db/Dbsns';
import Wrapper from '@/components/db/Wrapper';
export default {
  components:{
      dbheader:Dbheader,
      dbsns:Dbsns,
      wrapper:Wrapper
  }
}
</script>
<style>

</style>
